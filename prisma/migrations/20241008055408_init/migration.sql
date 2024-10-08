/*
  Warnings:

  - You are about to drop the `TestingModel` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "TestingModel";

-- CreateTable
CREATE TABLE "StatusType" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "StatusType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Status" (
    "id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "status_type_id" INTEGER NOT NULL,

    CONSTRAINT "Status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Episode" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,

    CONSTRAINT "Episode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "status_id" INTEGER NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "category_name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubCategory" (
    "id" SERIAL NOT NULL,
    "subcategory_name" TEXT NOT NULL,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "SubCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharacterEpisodeParticipation" (
    "id" SERIAL NOT NULL,
    "character_id" INTEGER NOT NULL,
    "episode_id" INTEGER NOT NULL,
    "start_time" TIMESTAMP(3) NOT NULL,
    "end_time" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CharacterEpisodeParticipation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StatusType_type_key" ON "StatusType"("type");

-- CreateIndex
CREATE UNIQUE INDEX "Status_status_key" ON "Status"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Episode_title_key" ON "Episode"("title");

-- AddForeignKey
ALTER TABLE "Episode" ADD CONSTRAINT "Episode_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "Status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "Status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubCategory" ADD CONSTRAINT "SubCategory_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterEpisodeParticipation" ADD CONSTRAINT "CharacterEpisodeParticipation_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterEpisodeParticipation" ADD CONSTRAINT "CharacterEpisodeParticipation_episode_id_fkey" FOREIGN KEY ("episode_id") REFERENCES "Episode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
