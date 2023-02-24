import {
  Injectable,
  NestMiddleware,
  UnauthorizedException,
} from '@nestjs/common';

import * as jwt from 'jsonwebtoken';
import { UserHelper } from 'src/helpers/user.helper';
import { PrismaService } from 'src/prisma.service';

export enum UserLevels {
  SuperAdmin = 'SuperAdmin',
  Admin = 'Admin',
  Vet = 'Vet',
  CORP = 'CORP',
  Farmer = 'Farmer',
}

@Injectable()
export class AuthMiddleware implements NestMiddleware {
  constructor(
    private readonly userHelper: UserHelper,
    private readonly prisma: PrismaService,
  ) {}
  use(req: any, res: any, next: () => void) {
    const headers = req.headers;
    const authorization = headers?.authorization;

    if (!authorization) {
      throw new UnauthorizedException('No token was provided');
    }

    const token = authorization.split(' ')[1];

    try {
      const decoded: any = jwt.verify(token, process.env.JWT_SECRET);
      const { user_id } = decoded;
      this.prisma.users
        .findUnique({
          where: {
            user_id,
          },
        })
        .then((data) => {
          this.userHelper.setUser({ user_id, role: data.user_level });
          next();
        });
    } catch (err) {
      throw new UnauthorizedException('Invalid token');
    }
  }
}
