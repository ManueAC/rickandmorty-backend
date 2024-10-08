import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { CharactersService } from '../services/characters.service';
import { Prisma } from '@prisma/client';

@Controller('characters')
export class CharactersController {
  constructor(private charactersService: CharactersService) {}

  @Get()
  getCharacterByFilter(@Param() params: Prisma.CharacterWhereUniqueInput) {
    console.log('====================================');
    console.log('getCharacterByFilter:params', params);
    console.log('====================================');
    return this.charactersService.findOne(params);
  }

  @Post()
  create(@Body() data: Prisma.CharacterCreateArgs) {
    return this.charactersService.create(data);
  }
  @Put(':id')
  update(@Body() data: Prisma.CharacterUpdateArgs) {
    return this.charactersService.update(data);
  }

  @Delete(':id')
  delete(@Param(':id') id: number) {
    return this.charactersService.delete(id);
  }
}
