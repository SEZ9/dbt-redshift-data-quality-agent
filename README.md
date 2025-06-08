# dbt-Redshift Data Quality Agent in Strands Agents
This project uses the Strands Agent framework combined with dbt MCP to build an automated data quality detection agent for the Redshift sample data.

## Setup Instructions

1. Clone the Repository and dbt MCP 
```
bash
git clone <your-repo-url>
cd <your-project-directory>
git clone https://github.com/dbt-labs/dbt-mcp.git

```
2. Set Up Python Environment
```
bash
python -m venv .venv
source .venv/bin/activate  # For macOS/Linux
# .venv\Scripts\activate.bat  # For Windows CMD
# .venv\Scripts\Activate.ps1  # For Windows PowerShell
```
3. Install Dependencies
```
bash
pip install strands-agents strands-agents-tools dbt-core dbt-redshift
```

4. dbt Configuration
Edit dbt_project.yml

Ensure the project name, model paths, and target Redshift schema are correctly set.

Example:
```
name: tickit_analytics
version: '1.0'
config-version: 2
profile: 'redshift_profile'
model-paths: ["models"]
For more details, see dbt_project.yml reference.
```
Edit profiles.yml

Set your Redshift connection credentials and target schema.

(Optional) Configure Seeds and Tests

Place CSV files in the seeds/ directory and configure as needed1.

Add or adjust tests in the tests/ directory.

## Running the Agent
Set the Path to dbt MCP

Update the command path in your agent code if your dbt-mcp virtual environment is in a custom location:
```
python
StdioServerParameters(
    command="/path/to/.venv/bin/dbt-mcp",
    args=[],
    env={}
)
```
Run the Agent Script
```
bash
python agent.py
```

The agent will:

- Execute dbt build and test commands via MCP

- Analyze results and generate data quality reports

- Output code-level fix suggestions with file paths and line numbers

Output
The agent prints:

- Available dbt tools

- Execution logs for each pipeline step

- English and Chinese data quality reports, including:

- Executive summary

