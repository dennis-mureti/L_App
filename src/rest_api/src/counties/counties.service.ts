import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { CreateCountyDto } from './dto/create-county.dto';
import { CreateSubCountyDto } from './dto/create-subcounty.dto';
import { UpdateCountyDto } from './dto/update-county.dto';

const client = new PrismaClient();

@Injectable()
export class CountiesService {
  async create(createCountyDto: CreateCountyDto) {
    const data = {
      ...createCountyDto,
      date_added: new Date(),
    };
    const county = await client.county
      .create({
        data,
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });
    return county;
  }

  findAll() {
    return `This action returns all counties`;
  }

  findOne(id: number) {
    return `This action returns a #${id} county`;
  }

  update(id: number, updateCountyDto: UpdateCountyDto) {
    return `This action updates a #${id} county`;
  }

  remove(id: number) {
    return `This action removes a #${id} county`;
  }

  async createSubCounty(createSubCountyDto: CreateSubCountyDto) {
    const data = {
      ...createSubCountyDto,
      county_id: createSubCountyDto.county_id,
      time_stamp: new Date(),
    };
    const subCounty = await client.sub_county
      .create({
        data,
      })
      .then((data) => data)
      .catch((err) => {
        throw new BadRequestException(err.message);
      });
    return subCounty;
  }
}
