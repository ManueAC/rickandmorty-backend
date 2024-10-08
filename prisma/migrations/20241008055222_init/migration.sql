-- CreateTable
CREATE TABLE "TestingModel" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "TestingModel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TestingModel_title_key" ON "TestingModel"("title");
