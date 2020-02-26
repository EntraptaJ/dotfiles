// src/index.ts
import { promises as fs } from 'fs';
import { dirname, resolve } from 'path';
import { configPath } from './Config';
import { getConfigs } from './Utils/getConfigs';
import { readJSON } from './Utils/readJSON';

const configDirectories = await fs.readdir(configPath, {
  withFileTypes: true,
});

const configFiles = await Promise.all(configDirectories.map(getConfigs));
for (const configFile of configFiles.filter(Boolean) as string[]) {
  const configDir = dirname(configFile);
  const config = await readJSON(configFile);

  for (const file of config.files) {
    console.log(
      `Config file of ${resolve(configDir, file.file)} to ${
        file.destination
      } for ${config.name}`,
    );
  }
}

setInterval(() => console.log('HelloWorld'), 2500);
