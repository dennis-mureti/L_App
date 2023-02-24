import { BadRequestException, Injectable } from '@nestjs/common';
import * as bcrypt from 'bcryptjs';
import { PrismaService } from 'src/prisma.service';
import { CreatePersonDto } from './dto/create-person.dto';
import { CreateUserLevelDto } from './dto/create-user-level';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UserLoginDto } from './dto/user-login.dto';
import * as jwt from 'jsonwebtoken';
import { EditUserLevelDto } from './dto/edit-user-level.dto';
import { UserLevels } from 'src/middleware/auth.middleware';

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}
  async create(createUserDto: CreateUserDto) {
    const data = {
      ...createUserDto,
      person_id: createUserDto.person_id,
      password: bcrypt.hashSync(createUserDto.password, 10),
    };

    const newUser = await this.prisma.users
      .create({
        data,
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });

    return newUser;
  }

  async findAll() {
    return `This action returns all users`;
  }

  async findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  async update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  async remove(id: number) {
    return `This action removes a #${id} user`;
  }

  async createUserLevel(createUserLevel: CreateUserLevelDto) {
    const newLevel = await this.prisma.user_level
      .create({
        data: createUserLevel,
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });

    return newLevel;
  }

  async createPerson(createPersonDto: CreatePersonDto) {
    const data = {
      ...createPersonDto,
      county_id: createPersonDto.county_id,
      sub_county_id: createPersonDto.sub_county_id,
    };

    const newPerson = await this.prisma.persons
      .create({
        data,
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });

    return newPerson;
  }

  async findAllPersons() {
    const persons = await this.prisma.persons
      .findMany({})
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });

    return persons;
  }

  async editUserLevel(editUserLevelDto: EditUserLevelDto) {
    const { user_id, role } = editUserLevelDto;

    const user_level = UserLevels[role];

    const updatedUserLevel = await this.prisma.users
      .update({
        where: {
          user_id,
        },
        data: {
          user_level,
        },
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });

    return updatedUserLevel;
  }

  async addSuperAdmin(user_id: string) {
    const superAdmin = this.editUserLevel({ user_id, role: 'SuperAdmin' });
    return superAdmin;
  }

  async addAdmin(user_id: string) {
    const admin = this.editUserLevel({ user_id, role: 'Admin' });
    return admin;
  }

  async addCorp(user_id: string) {
    const corp = this.editUserLevel({ user_id, role: 'CORP' });
    return corp;
  }

  async addVet(user_id: string) {
    const vet = this.editUserLevel({ user_id, role: 'Vet' });
    return vet;
  }

  async addFarmer(user_id: string) {
    const farmer = this.editUserLevel({ user_id, role: 'Farmer' });
    return farmer;
  }

  async userLogin(userLoginDto: UserLoginDto) {
    const { email, password } = userLoginDto;
    const user = await this.prisma.users
      .findUnique({
        where: {
          email,
        },
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });

    if (!user) {
      throw new BadRequestException('Invalid email');
    }

    const isPasswordValid = bcrypt.compareSync(password, user.password);

    if (!isPasswordValid) {
      throw new BadRequestException('Invalid password');
    }

    delete user.password;

    const token = await jwt.sign(user, process.env.JWT_SECRET, {
      expiresIn: '1d',
    });

    return {
      access_token: token,
    };
  }
}
