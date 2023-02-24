import {
  MiddlewareConsumer,
  Module,
  NestModule,
  RequestMethod,
} from '@nestjs/common';
import { UserHelper } from 'src/helpers/user.helper';
import { AuthMiddleware } from 'src/middleware/auth.middleware';
import { PrismaService } from 'src/prisma.service';
import { CorpsController } from './corps/corps.controller';
import { CorpsService } from './corps/corps.service';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';

@Module({
  controllers: [UsersController, CorpsController],
  providers: [UsersService, CorpsService, PrismaService, UserHelper],
})
export class UsersModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(AuthMiddleware)
      .exclude({
        path: 'users/login',
        method: RequestMethod.POST,
      })
      .forRoutes(UsersController);

    consumer.apply(AuthMiddleware).forRoutes(CorpsController);
  }
}
