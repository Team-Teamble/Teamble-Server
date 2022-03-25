import { LocalStorage } from 'node-localstorage';
import { nanoid } from 'nanoid';
import { Repository } from '.';
import { Project } from '../entity/project';
import { User } from '../entity/user';

export class LocalStorageRepository implements Repository {
  localStorage: LocalStorage;

  constructor(fileLocation: string) {
    this.localStorage = new LocalStorage(fileLocation);
  }
}
