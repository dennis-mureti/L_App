import { IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateProductDto {
  @IsString()
  product_name: string;
  @IsString()
  product_code: string;
  @IsString()
  @IsOptional()
  product_serial_code: string;
  @IsString()
  product_description: string;
  @IsNumber()
  @IsOptional()
  rate: BigInteger;
}
