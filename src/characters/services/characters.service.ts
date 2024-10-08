import { Injectable } from '@nestjs/common';
import { Character, Prisma } from '@prisma/client';
import { PrismaService } from 'src/database/prisma.service';

@Injectable()
export class CharactersService {
  constructor(private prisma: PrismaService) {}

  async findOne(
    characterWhereInput: Prisma.CharacterWhereUniqueInput,
  ): Promise<Character | null> {
    // const { id, ...rest } = characterWhereInput;
    return this.prisma.character.findUnique({
      where: {
        ...characterWhereInput,
      },
    });
  }

  async findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.CharacterWhereUniqueInput;
    where?: Prisma.CharacterWhereInput;
    orderBy?: Prisma.CharacterOrderByWithRelationInput;
  }): Promise<Character[]> {
    const { skip, take, cursor, where, orderBy } = params;

    return this.prisma.character.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async create(data: Prisma.CharacterCreateArgs): Promise<Character> {
    //   async create(data: Prisma.CharacterCreateInput): Promise<Character> {
    return this.prisma.character.create(data);
  }

  async update(data: Prisma.CharacterUpdateArgs): Promise<Character> {
    return this.prisma.character.update(data);
  }

  async delete(id: number) {
    // return this.prisma.character.update({
    //   where: {
    //     id,
    //   },
    //   data: {
    //     status: {
    //     }
    //   },
    // });
    return this.prisma.character.delete({
      where: {
        id,
      },
    });
  }
}
