import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { Roles } from 'src/decorators/roles.decorators';
import { RolesGuard } from 'src/guards/roles.guard';
import { UserLevels } from 'src/middleware/auth.middleware';
import { CreateCorpDto } from '../dto/create-corp.dto';
import { CorpsService } from './corps.service';

@Controller('corps')
export class CorpsController {
  constructor(private readonly corpService: CorpsService) {}

  @UseGuards(RolesGuard)
  @Roles([UserLevels.Admin])
  @Post('add')
  createCorp(@Body() createCorpDto: CreateCorpDto) {
    return this.corpService.createCorp(createCorpDto);
  }
}
