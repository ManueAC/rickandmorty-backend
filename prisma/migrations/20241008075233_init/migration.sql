/*
  Warnings:

  - You are about to drop the column `category_name` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `status_id` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `character_id` on the `CharacterEpisodeParticipation` table. All the data in the column will be lost.
  - You are about to drop the column `end_time` on the `CharacterEpisodeParticipation` table. All the data in the column will be lost.
  - You are about to drop the column `episode_id` on the `CharacterEpisodeParticipation` table. All the data in the column will be lost.
  - You are about to drop the column `start_time` on the `CharacterEpisodeParticipation` table. All the data in the column will be lost.
  - You are about to drop the column `status_id` on the `Episode` table. All the data in the column will be lost.
  - You are about to drop the column `status_type_id` on the `Status` table. All the data in the column will be lost.
  - You are about to drop the `SubCategory` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[categoryName]` on the table `Category` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `categoryName` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `statusId` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `characterId` to the `CharacterEpisodeParticipation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endTime` to the `CharacterEpisodeParticipation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `episodeId` to the `CharacterEpisodeParticipation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startTime` to the `CharacterEpisodeParticipation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `statusId` to the `Episode` table without a default value. This is not possible if the table is not empty.
  - Added the required column `statusTypeId` to the `Status` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_status_id_fkey";

-- DropForeignKey
ALTER TABLE "CharacterEpisodeParticipation" DROP CONSTRAINT "CharacterEpisodeParticipation_character_id_fkey";

-- DropForeignKey
ALTER TABLE "CharacterEpisodeParticipation" DROP CONSTRAINT "CharacterEpisodeParticipation_episode_id_fkey";

-- DropForeignKey
ALTER TABLE "Episode" DROP CONSTRAINT "Episode_status_id_fkey";

-- DropForeignKey
ALTER TABLE "SubCategory" DROP CONSTRAINT "SubCategory_category_id_fkey";

-- DropIndex
DROP INDEX "Episode_title_key";

-- DropIndex
DROP INDEX "Status_status_key";

-- AlterTable
ALTER TABLE "Category" DROP COLUMN "category_name",
ADD COLUMN     "categoryName" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Character" DROP COLUMN "status_id",
ADD COLUMN     "statusId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "CharacterEpisodeParticipation" DROP COLUMN "character_id",
DROP COLUMN "end_time",
DROP COLUMN "episode_id",
DROP COLUMN "start_time",
ADD COLUMN     "characterId" INTEGER NOT NULL,
ADD COLUMN     "endTime" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "episodeId" INTEGER NOT NULL,
ADD COLUMN     "startTime" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Episode" DROP COLUMN "status_id",
ADD COLUMN     "statusId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Status" DROP COLUMN "status_type_id",
ADD COLUMN     "statusTypeId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "SubCategory";

-- CreateTable
CREATE TABLE "Subcategory" (
    "id" SERIAL NOT NULL,
    "subcategoryName" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "Subcategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_categoryName_key" ON "Category"("categoryName");

-- AddForeignKey
ALTER TABLE "Status" ADD CONSTRAINT "Status_statusTypeId_fkey" FOREIGN KEY ("statusTypeId") REFERENCES "StatusType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subcategory" ADD CONSTRAINT "Subcategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "Status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Episode" ADD CONSTRAINT "Episode_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "Status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterEpisodeParticipation" ADD CONSTRAINT "CharacterEpisodeParticipation_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterEpisodeParticipation" ADD CONSTRAINT "CharacterEpisodeParticipation_episodeId_fkey" FOREIGN KEY ("episodeId") REFERENCES "Episode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
