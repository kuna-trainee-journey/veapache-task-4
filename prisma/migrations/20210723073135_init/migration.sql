-- CreateTable
CREATE TABLE "Skill" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "damage" DECIMAL(65,30) NOT NULL,
    "cooldown" DECIMAL(65,30) NOT NULL,
    "manaCost" DECIMAL(65,30) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Weapon" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "damage" DECIMAL(65,30) NOT NULL,
    "attackSpeed" DECIMAL(65,30) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlayerSkill" (
    "playerId" TEXT NOT NULL,
    "skillId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PlayerWeapon" (
    "playerId" TEXT NOT NULL,
    "weaponId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PlayerStat" (
    "id" TEXT NOT NULL,
    "playerId" TEXT NOT NULL,
    "strength" INTEGER NOT NULL DEFAULT 1,
    "magic" INTEGER NOT NULL DEFAULT 1,
    "dexterity" INTEGER NOT NULL DEFAULT 1,
    "vitality" INTEGER NOT NULL DEFAULT 1,
    "life" INTEGER NOT NULL DEFAULT 1,
    "mana" INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Player" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "level" INTEGER NOT NULL DEFAULT 0,
    "experience" INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Skill.name_unique" ON "Skill"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Weapon.name_unique" ON "Weapon"("name");

-- CreateIndex
CREATE UNIQUE INDEX "player_skill_id" ON "PlayerSkill"("playerId", "skillId");

-- CreateIndex
CREATE UNIQUE INDEX "player_weapon_id" ON "PlayerWeapon"("playerId", "weaponId");

-- CreateIndex
CREATE UNIQUE INDEX "PlayerStat.playerId_unique" ON "PlayerStat"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "Player.name_unique" ON "Player"("name");

-- AddForeignKey
ALTER TABLE "PlayerSkill" ADD FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerSkill" ADD FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerWeapon" ADD FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerWeapon" ADD FOREIGN KEY ("weaponId") REFERENCES "Weapon"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerStat" ADD FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE CASCADE ON UPDATE CASCADE;
