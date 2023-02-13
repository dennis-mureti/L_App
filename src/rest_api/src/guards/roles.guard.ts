import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Observable } from 'rxjs';
import { UserHelper } from 'src/helpers/user.helper';
import { UserLevels } from 'src/middleware/auth.middleware';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(
    private readonly reflector: Reflector,
    private readonly userHelper: UserHelper,
  ) {}
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const roles = this.reflector.get<string[]>('roles', context.getHandler());

    const user = this.userHelper.getUSer();

    return roles.some((a) => {
      return a == user.role || user.role == UserLevels.SuperAdmin;
    });
  }
}
