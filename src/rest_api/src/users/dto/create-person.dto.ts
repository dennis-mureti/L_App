import { IsIn, IsNotEmpty, IsString } from 'class-validator';

export class CreatePersonDto {
  @IsNotEmpty()
  @IsString()
  first_name: string;

  @IsNotEmpty()
  @IsString()
  last_name: string;

  @IsNotEmpty()
  @IsString()
  id_number: string;

  @IsNotEmpty()
  @IsString()
  @IsIn(['M', 'F'])
  gender: string;

  @IsNotEmpty()
  @IsString()
  phone_no: string;

  @IsNotEmpty()
  @IsString()
  county_id: string;

  @IsNotEmpty()
  @IsString()
  sub_county_id: string;
}
