import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { PrismaClient } from '@prisma/client';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';

const prisma = new PrismaClient();

@Injectable()
export class ProductService {
  async create(createProductDto: CreateProductDto) {
    // TODO: to work on getting authenticated user and details on the incompleted fields
    const product = await prisma.products
      .create({
        data: {
          ...createProductDto,
          rate: +createProductDto.rate,
          created_by: '',
          updated_by: '',
        },
      })
      .catch((error) => {
        if (error instanceof PrismaClientKnownRequestError) {
          if (error.code == 'P2002')
            throw new BadRequestException('product with that code exists');
        }
        throw new BadRequestException(error);
      });

    return product;
  }

  async findAll() {
    const products = await prisma.products.findMany();

    return products;
  }

  async findOne(id: string) {
    const product = await prisma.products
      .findUnique({
        where: {
          product_id: id,
        },
      })
      .catch((error) => {
        throw new BadRequestException(error.message);
      });

    return product;
  }

  async update(id: string, updateProductDto: UpdateProductDto) {
    // TODO: to work on getting authenticated user and details on the incompleted fields
    const product = await prisma.products
      .update({
        where: {
          product_id: id,
        },
        data: {
          ...updateProductDto,
          rate: +updateProductDto.rate,
        },
      })
      .catch((error) => {
        throw new BadRequestException(error.message);
      });

    return product;
  }

  async remove(id: string) {
    await prisma.products
      .delete({
        where: {
          product_id: id,
        },
      })
      .catch((error) => {
        throw new BadRequestException(error.message);
      });

    return { message: 'product deleted successfully' };
  }
}
