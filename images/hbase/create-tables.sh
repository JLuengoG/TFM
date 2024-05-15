#!/usr/bin/env bash

echo -e "create_namespace 'zts'" | hbase shell -n
echo -e "create 'zts:day', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31',  {NUMREGIONS => 15, SPLITALGO => 'UniformSplit'}" | hbase shell -n
echo -e "create 'zts:hour', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',  {NUMREGIONS => 15, SPLITALGO => 'UniformSplit'}" | hbase shell -n
echo -e "create 'zts:minute', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59',  {NUMREGIONS => 15, SPLITALGO => 'UniformSplit'}" | hbase shell -n
echo -e "create 'zts:second', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59',  {NUMREGIONS => 15, SPLITALGO => 'UniformSplit'}" | hbase shell -n
echo -e "create 'zts:constant', {NAME => '0', VERSIONS => 5}, {NUMREGIONS => 15, SPLITALGO => 'UniformSplit'}" | hbase shell -n
echo -e "create_namespace 'zts_metadata'" | hbase shell -n
echo -e "create 'zts_metadata:internal', 'm'" | hbase shell -n

