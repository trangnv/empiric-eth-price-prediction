# Onchain ETH price prediction
The contract pulls the last n=10 check_point ETH price from Empiric oracle and uses that for a super smart algorithm to predict price for the next epoch π

## Deployment:
```bash
β― nile compile
π€ Compiling all Cairo contracts in the contracts directory
π¨ Compiling contracts/contract.cairo
π¨ Compiling contracts/contract_storage.cairo
π¨ Compiling contracts/oracle/IEmpiricOracle.cairo
π¨ Compiling contracts/oracle/ISummaryStats.cairo
π¨ Compiling contracts/libraries/types/data_types.cairo
π¨ Compiling contracts/libraries/helpers/helpers.cairo
π¨ Compiling contracts/libraries/helpers/constants.cairo
β Done

β― nile deploy contract --network goerli
π Deploying contract
β³ οΈDeployment of contract successfully sent at 0x06acea7a35c3226898b8143cc1ec76a7b079bb023fd660852b6b9ad7a17e1ebb
π§Ύ Transaction hash: 0x4873b9721d8942955689abb36c81b76b98948145272042fa746ef81a82849ee
π¦ Registering 0x06acea7a35c3226898b8143cc1ec76a7b079bb023fd660852b6b9ad7a17e1ebb in goerli.deployments.txt
```
