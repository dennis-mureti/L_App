import { Test, TestingModule } from '@nestjs/testing';
import { CorpsService } from './corps.service';

describe('CorpsService', () => {
  let service: CorpsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CorpsService],
    }).compile();

    service = module.get<CorpsService>(CorpsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
