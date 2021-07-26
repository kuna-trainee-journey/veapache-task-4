import { Injectable, Inject } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { DIPrisma } from '../constants';

@Injectable()
export class PlayersService {
  constructor(@Inject(DIPrisma) private prisma: PrismaClient) {}

  getPlayers() {
    return this.prisma.player.findMany({
      include: {
        PlayerStats: true,
        PlayerSkills: true,
        PlayerWeapons: true,
      },
    })
  }
}
