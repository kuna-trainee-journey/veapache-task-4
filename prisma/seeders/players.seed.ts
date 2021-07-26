import { PrismaClient } from '@prisma/client';

export const seedPlayers = (prisma: PrismaClient) : any => {
  return prisma.player.create({
    data: {
      name: 'User seed'
    }
  })
}