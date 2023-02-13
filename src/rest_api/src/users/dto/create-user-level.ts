import { IsIn, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserLevelDto {
  @IsNotEmpty()
  @IsString()
  @IsIn(['SuperAdmin', 'Admin', 'Vet', 'CORP', 'Farmer'])
  user_level_name: string;
}
