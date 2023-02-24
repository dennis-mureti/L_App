import { Test, TestingModule } from '@nestjs/testing';
import { CorpsController } from './corps.controller';

describe('CorpsController', () => {
  let controller: CorpsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CorpsController],
    }).compile();

    controller = module.get<CorpsController>(CorpsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
