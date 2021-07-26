import { Module, Global } from '@nestjs/common';
import prisma from './client';
import { DIPrisma } from '../constants';

const prismaProvider = {
  provide: DIPrisma,
  useValue: prisma,
}

@Global()
@Module({
  providers: [
    prismaProvider,
  ],
  exports: [
    prismaProvider,
  ],
})

export class PrismaModule {}
