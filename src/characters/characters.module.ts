import { Module } from '@nestjs/common';
import { CharactersController } from './controllers/characters.controller';
import { CharactersService } from './services/characters.service';

@Module({
  imports: [],
  controllers: [CharactersController],
  providers: [CharactersService],
  exports: [],
})
export class CharactersModule {}
