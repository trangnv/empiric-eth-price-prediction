# Onchain ETH price prediction
The contract pulls the last n=10 check_point ETH price from Empiric oracle and uses that for a super smart algorithm to predict price for the next epoch 😎

## Deployment:
```bash
❯ nile compile
🤖 Compiling all Cairo contracts in the contracts directory
🔨 Compiling contracts/contract.cairo
🔨 Compiling contracts/contract_storage.cairo
🔨 Compiling contracts/oracle/IEmpiricOracle.cairo
🔨 Compiling contracts/oracle/ISummaryStats.cairo
🔨 Compiling contracts/libraries/types/data_types.cairo
🔨 Compiling contracts/libraries/helpers/helpers.cairo
🔨 Compiling contracts/libraries/helpers/constants.cairo
✅ Done

❯ nile deploy contract --network goerli
🚀 Deploying contract
⏳ ️Deployment of contract successfully sent at 0x06acea7a35c3226898b8143cc1ec76a7b079bb023fd660852b6b9ad7a17e1ebb
🧾 Transaction hash: 0x4873b9721d8942955689abb36c81b76b98948145272042fa746ef81a82849ee
📦 Registering 0x06acea7a35c3226898b8143cc1ec76a7b079bb023fd660852b6b9ad7a17e1ebb in goerli.deployments.txt
```
