import { IsNotEmpty, IsString } from 'class-validator';

export class CreateSubCountyDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsNotEmpty()
  county_id: string;
}
