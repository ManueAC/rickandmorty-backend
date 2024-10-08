import { Module } from '@nestjs/common';
import * as Joi from 'joi';
import { ConfigModule } from '@nestjs/config';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { environments } from './environments';
import { PrismaService } from './database/prisma.service';
import { CharactersController } from './characters/controllers/characters.controller';
import { CharactersModule } from './characters/characters.module';
import config from './database/config';
import { CharactersService } from './characters/services/characters.service';
import { PrismaModule } from './database/prisma.module';
@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: environments[process.env.NODE_ENV] || '.env',
      load: [config],
      isGlobal: true,
      validationSchema: Joi.object({
        DATABASE_URL: Joi.string().required(),
        POSTGRES_CONNECTION: Joi.string().required(),
        DATABASE_NAME: Joi.string().required(),
        POSTGRES_INITDB_ROOT_USERNAME: Joi.string().required(),
        POSTGRES_INITDB_ROOT_PASSWORD: Joi.string().required(),
        POSTGRES_HOST: Joi.string().required(),
        POSTGRES_PORT: Joi.string().required(),
        POSTGRES_DB: Joi.string().required(),
        POSTGRES_SCHEMA: Joi.string().required(),
      }),
    }),
    CharactersModule,
    PrismaModule,
  ],
  controllers: [AppController, CharactersController],
  providers: [AppService, PrismaService, CharactersService],
})
export class AppModule {}
