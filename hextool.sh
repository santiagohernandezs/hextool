#!/bin/bash

# Generate
#  - GraphQL
#  - Instance
#   - Domain
#    - Controllers
#   - Infrastructure
#    - Repositories
#     - Inputs
#     - Queries
#     - Mutations
#   - Application
#    - UseCases
#
# Delete

action=$1
item=$2
name=$3

# flags

# -e empty
empty=false

while test $# -gt 0; do
    case "$1" in
    -h | --help)
        echo "$action - attempt to capture frames"
        echo " "
        echo "$action [options] application [arguments]"
        echo " "
        echo "options:"
        echo "-h, --help                show brief help"
        echo "-a, --action=ACTION       specify an action to use"
        echo "-o, --output-dir=DIR      specify a directory to store output in"
        exit 0
        ;;
    *)
        shift
        ;;
    esac
done

generator() {

    case $item in
    graphql)
        mkdir graphql
        cd graphql
        mkdir queries && touch queries/queries.ts
        mkdir mutations && touch mutations/mutations.ts
        mkdir middlewares && touch middlewares/middlewares.ts
        ;;
    instance)
        echo "instance"

        while test $# -gt 0; do
            case "$4" in
            -e | --empty)
                mkdir $name
                ;;
            *)
                mkdir $name
                cd $name
                mkdir domain && touch domain/domain.ts
                mkdir application && touch application/usecases.ts && touch application/helpers.ts
                mkdir infrastructure && cd infrastructure && touch index.ts
                mkdir input && touch input/input.ts
                mkdir queries && touch queries/queries.ts
                mkdir mutations && touch mutations/mutations.ts
                ;;
            esac
        done
        ;;
    domain)
        mkdir domain && touch domain/domain.ts
        ;;

    application)
        mkdir application && touch application/usecases.ts && touch application/helpers.ts
        ;;
    infrastructure)
        mkdir infrastructure && cd infrastructure && touch index.ts
        ;;
    *)
        echo "Invalid item"
        ;;
    esac
}

case $action in
generate)
    generator
    ;;
delete)
    echo "delete"
    ;;
*)
    echo "Invalid action"
    ;;
esac

# while test $# -gt 0; do
#   case "$1" in
#     -h|--help)
#       echo "$package - attempt to capture frames"
#       echo " "
#       echo "$package [options] application [arguments]"
#       echo " "
#       echo "options:"
#       echo "-h, --help                show brief help"
#       echo "-a, --action=ACTION       specify an action to use"
#       echo "-o, --output-dir=DIR      specify a directory to store output in"
#       exit 0
#       ;;
#     -a)
#       shift
#       if test $# -gt 0; then
#         export PROCESS=$1
#       else
#         echo "no process specified"
#         exit 1
#       fi
#       shift
#       ;;
#     --action*)
#       export PROCESS=`echo $1 | sed -e 's/^[^=]*=//g'`
#       shift
#       ;;
#     -o)
#       shift
#       if test $# -gt 0; then
#         export OUTPUT=$1
#       else
#         echo "no output dir specified"
#         exit 1
#       fi
#       shift
#       ;;
#     --output-dir*)
#       export OUTPUT=`echo $1 | sed -e 's/^[^=]*=//g'`
#       shift
#       ;;
#     *)
#       break
#       ;;
#   esac
# done

# mkdir $name
# cd $name
# mkdir domain && touch domain/domain.ts
# mkdir application && touch application/usecases.ts && touch application/helpers.ts
# mkdir infrastructure && cd infrastructure && touch index.ts
# mkdir input && touch input/input.ts
# mkdir queries && touch queries/queries.ts
# mkdir mutations && touch mutations/mutations.ts
