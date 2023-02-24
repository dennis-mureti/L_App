import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { UseGuards } from '@nestjs/common/decorators';
import { Roles } from 'src/decorators/roles.decorators';
import { RolesGuard } from 'src/guards/roles.guard';
import { UserLevels } from 'src/middleware/auth.middleware';
import { CreatePersonDto } from './dto/create-person.dto';
import { CreateUserLevelDto } from './dto/create-user-level';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UserIdDto } from './dto/user-id.dto';
import { UserLoginDto } from './dto/user-login.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('new')
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @Get()
  findAll() {
    return this.usersService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.usersService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
    return this.usersService.update(+id, updateUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.usersService.remove(+id);
  }

  @UseGuards(RolesGuard)
  @Roles([UserLevels.SuperAdmin])
  @Post('level')
  createUserLevel(@Body() createUserLevel: CreateUserLevelDto) {
    return this.usersService.createUserLevel(createUserLevel);
  }

  @Post('person')
  createPerson(@Body() createPersonDto: CreatePersonDto) {
    return this.usersService.createPerson(createPersonDto);
  }

  @UseGuards(RolesGuard)
  @Roles([UserLevels.SuperAdmin])
  @Patch('add/superadmin')
  addSuperAdmin(@Body() user: UserIdDto) {
    return this.usersService.addSuperAdmin(user.user_id);
  }

  @UseGuards(RolesGuard)
  @Roles([UserLevels.Admin])
  @Patch('add/admin')
  addAdmin(@Body() user: UserIdDto) {
    return this.usersService.addAdmin(user.user_id);
  }

  @Post('login')
  userLoging(@Body() credentials: UserLoginDto) {
    return this.usersService.userLogin(credentials);
  }

  @UseGuards(RolesGuard)
  @Roles([UserLevels.CORP, UserLevels.Farmer])
  @Get('persons/all')
  findAllPersons() {
    return this.usersService.findAllPersons();
  }
}
