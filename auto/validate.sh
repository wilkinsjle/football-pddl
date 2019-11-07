#!/bin/bash

echo "Solve and validate problem and domain files"

domain=$(cat gfootball_domain.pddl)
problem=$(cat gfootball_problem.pddl)

JSON_STRING=$( jq -n \
                  --arg dm "$domain" \
                  --arg pr "$problem" \
                  '{domain: $dm, problem: $pr}' )

curl --data "$JSON_STRING" --HEADER "Content-Type: application/json" POST solver.planning.domains/solve-and-validate
