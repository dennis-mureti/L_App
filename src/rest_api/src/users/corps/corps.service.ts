import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { CreateCorpDto } from '../dto/create-corp.dto';
import { CreatePersonDto } from '../dto/create-person.dto';
import * as bcrypt from 'bcryptjs';
import { UserLevels } from 'src/middleware/auth.middleware';
import { v4 as uuid } from 'uuid';

@Injectable()
export class CorpsService {
  constructor(private readonly prisma: PrismaService) {}

  async createCorp(createCorpDto: CreateCorpDto) {
    const person_id = uuid();
    const password = Math.random().toString(32).slice(2);

    console.log('password', password);

    const {
      first_name,
      last_name,
      id_number,
      gender,
      phone_no,
      county_id,
      sub_county_id,
      email,
      is_vet,
      vet_reg_number,
    } = createCorpDto;

    const person: CreatePersonDto = {
      first_name,
      last_name,
      id_number,
      gender,
      phone_no,
      county_id,
      sub_county_id,
    };

    const newPerson = this.prisma.persons.create({
      data: {
        ...person,
        person_id,
        county_id,
        sub_county_id,
      },
    });

    const newUser = this.prisma.users.create({
      data: {
        email,
        password: bcrypt.hashSync(password, 10),
        user_level: UserLevels.CORP,
        person_id,
      },
    });

    const newCorp = this.prisma.corps.create({
      data: {
        is_vet,
        vet_reg_number,
        person_id,
      },
    });

    try {
      const user = await this.prisma.$transaction([
        newPerson,
        newUser,
        newCorp,
      ]);
      return user;
    } catch (error: any) {
      throw new BadRequestException(error.message);
    }
  }
}
