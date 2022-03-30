import { Project } from '../entity/project';
import { User } from '../entity/user';

export interface Repository {
  createUser(user: Pick<User, 'email' | 'name' | 'phone'>): Promise<User>;
  getUsers(): Promise<User[]>;
  getUserById(userId: string): Promise<User | null>;
}
