import { IsIn, IsNotEmpty, IsString } from 'class-validator';

export class EditUserLevelDto {
  @IsNotEmpty()
  @IsString()
  user_id: string;

  @IsNotEmpty()
  @IsString()
  @IsIn(['SuperAdmin', 'Admin', 'Vet', 'CORP', 'Farmer'])
  role: string;
}
