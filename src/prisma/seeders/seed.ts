import { PrismaClient } from '@prisma/client';
import { seedPlayers } from './players.seed';

const prisma = new PrismaClient();

export async function main() {
  await seedPlayers(prisma);
}

main()
  .then(() => {
    console.log('db seeded');
    process.exit(1);
  })
  .catch((error) => {
    console.log('Error when seeding db, ', error);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

