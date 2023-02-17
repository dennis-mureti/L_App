import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { PrismaClient } from '@prisma/client';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';

const prisma = new PrismaClient();

@Injectable()
export class ProductService {
  async create(createProductDto: CreateProductDto) {
    // TODO: To have a review of created_by and updated_by fields
    // TODO: Should they be 'name of a person' or reference to 'user' 'user_id' table
    try {
      const createdProduct = await prisma.products.create({
        data: {
          ...createProductDto,
          rate: +createProductDto.rate,
          created_by: '',
          updated_by: '',
        },
      });

      return createdProduct;
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        console.log('is an error of prisma');
        if (error.code == 'P2002')
          throw new BadRequestException('product code should be unique');
      }
      throw error;
    }
  }

  async findAll() {
    const products = await prisma.products.findMany();

    return products;
  }

  async findOne(id: string) {
    const product = await prisma.products.findUnique({
      where: {
        product_id: id,
      },
    });

    if (!product) throw new NotFoundException('product not found');
    return product;
  }

  async update(id: string, updateProductDto: UpdateProductDto) {
    // TODO: To have a review of created_by and updated_by fields
    // TODO: Should they be 'name of a person' or reference to 'user' 'user_id' table
    try {
      const updatedProduct = await prisma.products.update({
        where: {
          product_id: id,
        },
        data: {
          ...updateProductDto,
          rate: +updateProductDto.rate,
        },
      });

      return updatedProduct;
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        if (error.code == 'P2002')
          throw new BadRequestException('product code should be unique');
      }
    }
  }

  async remove(id: string) {
    try {
      await prisma.products.delete({
        where: {
          product_id: id,
        },
      });

      return { message: 'product deleted successfully' };
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        if (error.code == 'P2025')
          throw new NotFoundException('product does not exist');
      }

      throw error;
    }
  }
}
