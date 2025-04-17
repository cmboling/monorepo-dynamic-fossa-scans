# FOSSA Monorepo Analyzer

This script automates the process of analyzing each subproject in a monorepo using [FOSSA](https://fossa.com)'s CLI tool. It dynamically generates a `.fossa.yml` file for each subdirectory, runs analysis, and then cleans up the temporary configuration file.

## 🧠 Why This Script?

FOSSA typically expects a `.fossa.yml` file in each project root. In monorepos with multiple isolated modules, you may want to scan each module as its own FOSSA project. This script helps automate that.

## 📁 Example Monorepo Structure
Note: The contents of this repo does not reflect the example below 😆

```
monorepo/
├── test-0/
│   └── package.json
├── test-1/
│   └── pom.xml
├── test-2/
│   └── go.mod
└── run-fossa.sh
```

## 🚀 How It Works

1. Iterates over each subdirectory at the root of the monorepo.
2. Dynamically creates a `.fossa.yml` file with the project ID set to the folder name.
3. Runs `fossa analyze` in that folder.
4. Cleans up the `.fossa.yml` after analysis is complete.

## 🔧 Prerequisites

- [FOSSA CLI](https://github.com/fossas/fossa-cli) must be installed and available in your `$PATH`.
- A push-only FOSSA API token from a user with valid project permissions is the minimum requirement.

## 🛠️ Usage

1. Place the `run-fossa.sh` script in the root of your monorepo.
2. Make it executable:

   ```bash
   chmod +x run-fossa.sh
   ```

3. Run the script:

   ```bash
   ./run-fossa.sh
   ```

Each module will be analyzed independently as `monorepo-<folder-name>` in FOSSA.

## 📎 Notes

- The script assumes all first-level subdirectories are FOSSA projects.
- Adjust the `project.id` prefix (`monorepo-`) if you want to namespace differently.
- If a subdirectory does not contain any recognizable package manager files, the analysis may fail.

## 🧼 Cleanup

No residual `.fossa.yml` files will be left behind—each is removed after the scan.

## Example FOSSA UI results

<img width="312" alt="image" src="https://github.com/user-attachments/assets/3030d011-ad96-4952-921e-86890e67d244" />


## 📄 License

MIT
