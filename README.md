
# Walmart.com.br ALDEBARAN

## PLATFORM
      Ruby 2.2.2
## DEPENDENCIES
      cucumber
      hash_compare
      hash_diff
      httparty
      json
      mime-types (~> 1.16)
      net-ssh
      pry
      pry-byebug
      rspec
      ruby-oci8 (~> 2.2, >= 2.2.3)
## BUNDLED WITH
        1.14.4
## Installation Instructions
### Recommendations
        * Use RVM to handle rubies and gemsets
        * See installation instructions here (https://rvm.io/rvm/install)
        * Install bundler
                $ gem install bundler

        * Project Installation
                $ git clone git@gitlab.wmxp.com.br:aldebaran/aldebaran-functional-tests.git
                $ bundle install

## ALDEBARAN Endpoints tests
        Executar todos os testes no ambiente de QA:
        $ cucumber -p qa

        Executar todos os testes no ambiente de Staging:
        $ cucumber -p stg

        Executar feature especifica no ambiente de QA:
        $ cucumber -p qa features/aldebaran-products.feature
        $ cucumber -p qa features/aldebaran-deliveries.feature
        $ cucumber -p qa features/aldebaran-stockunit.feature
        $ cucumber -p qa features/aldebaran-recdocs.feature
        $ cucumber -p qa features/aldebaran-returnitems.feature

## ALDEBARAN Tags exemplos

        $ cucumber -p qa -t @ready Executa todas as features
        $ cucumber -p qa -t @<nome da feature> executa todos os cenarios da feature escolhida

## PROFILES

        default: --no-source --color
        qa_aldebaran_jenkins:                       ENV="qa" debug=true  -f json -o execution_log.json
        qa:                                         ENV="qa" debug=true
        stg_aldebaran_jenkins:                      ENV="stg" debug=false  -f json -o execution_log.json
        stg:                                        ENV="stg" debug=true

## HOW To install ruby-oci8
        To execute Aldeban tests we need access the Oracle Database to get data for the tests scenarios.
        To do this the project is using the gem oci-8.
        http://stackoverflow.com/questions/11894194/how-to-install-ruby-oci8
        Slightly updated version of install of ruby-oci8 for 10.9/10.10/10.11OSX Mavericks/Yosemite/El Capitan -
        step-by-step:
        Go here: http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html
        Download the 64bit versions of
        instantclient-sqlplus,
        instantclient-sdk,
        instantclient-basic - the 32bit versions do not work with OSX 10.9

        Create directories at /opt/oracle
        Unzip instantclient-basic first, move to /opt/oracle
        (should add a folder - something like /opt/oracle/instantclient_11_2/)
        Unzip instantclient-sdk and move its contents to /opt/oracle/instantclient_11_2/
        Unzip instantclient-sqlplus and move its contents /opt/oracle/instantclient_11_2/

        Open Terminal (if you haven't already) and type...
        DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2 export DYLD_LIBRARY_PATH
        ORACLE_HOME=/opt/oracle/instantclient_11_2 export ORACLE_HOME

        cd /opt/oracle/instantclient_11_2
        ln -s libclntsh.dylib.11.1 libclntsh.dylib (creates a symbolic link)

        env
        verify that DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2
        (be sure there's no trailing / after instantclient_11_2)
        verify ORACLE_HOME=/opt/oracle/instantclient_11_2

        gem install ruby-oci8

## Setup to be done in server that will run the tests:
        We need to execute the following shell command in the server before execute the tests.
        This command prevents we have error because of graphic accentuation.
        command# export NLS_LANG="AMERICAN_AMERICA.UTF8"
