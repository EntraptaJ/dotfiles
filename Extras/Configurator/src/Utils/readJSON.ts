// src/Utils/readJSON.ts
import { promises as fs } from 'fs';

export interface ConfigConfig {
  name: string;
  files: {
    file: string;
    destination: string;
  }[];
}

/**
 * Reads JSON File into JavaScript Objects
 */
export async function readJSON(filePath: string): Promise<ConfigConfig> {
  const file = await fs.readFile(filePath);

  return JSON.parse(file.toString());
}
