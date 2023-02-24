import { IsNotEmpty, IsString } from 'class-validator';

export class CreateCountyDto {
  @IsNotEmpty()
  @IsString()
  name: string;
}
