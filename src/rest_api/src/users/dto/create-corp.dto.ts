import { IsEmail, IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { CreatePersonDto } from './create-person.dto';

class CorpDto extends CreatePersonDto {
  @IsOptional()
  @IsString()
  is_vet?: string;

  @IsOptional()
  @IsString()
  vet_reg_number?: string;
}

export class CreateCorpDto extends CorpDto {
  @IsNotEmpty()
  @IsEmail()
  email: string;
}
