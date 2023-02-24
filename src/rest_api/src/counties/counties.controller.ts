import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CountiesService } from './counties.service';
import { CreateCountyDto } from './dto/create-county.dto';
import { CreateSubCountyDto } from './dto/create-subcounty.dto';
import { UpdateCountyDto } from './dto/update-county.dto';

@Controller('counties')
export class CountiesController {
  constructor(private readonly countiesService: CountiesService) {}

  @Post('create')
  create(@Body() createCountyDto: CreateCountyDto) {
    return this.countiesService.create(createCountyDto);
  }

  @Get()
  findAll() {
    return this.countiesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.countiesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCountyDto: UpdateCountyDto) {
    return this.countiesService.update(+id, updateCountyDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.countiesService.remove(+id);
  }
  @Post('create/subcounty')
  createSubCounty(@Body() subCounty: CreateSubCountyDto) {
    return this.countiesService.createSubCounty(subCounty);
  }
}
