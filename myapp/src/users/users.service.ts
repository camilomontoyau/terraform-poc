import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './user.entity';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  findAll(): Promise<User[]> {
    return this.usersRepository.find();
  }

  findOne(id: string): Promise<User> {
    return this.usersRepository.findOne({ where: { id } });
  }

  create(user: User): Promise<User> {
    return this.usersRepository.save(user);
  }

  async update(id: string, updatedUser: User): Promise<void> {
    await this.usersRepository.update(id, updatedUser);
  }

  async remove(id: string): Promise<void> {
    await this.usersRepository.delete(id);
  }
}