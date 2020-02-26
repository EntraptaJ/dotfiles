// src/Utils/getConfigs.ts
import { Dirent, promises as fs } from 'fs';
import { resolve } from 'path';
import { configPath } from '../Config';

export async function getConfigs(
  configDirectory: Dirent,
): Promise<string | undefined> {
  console.log(resolve(configPath, configDirectory.name, 'config.json'));

  try {
    const filePath = await fs.realpath(
      resolve(configPath, configDirectory.name, 'config.json'),
    );

    return filePath as string;
  } catch {}
}
