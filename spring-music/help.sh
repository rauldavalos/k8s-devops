#!/usr/bin/env bash

echo "To create the 'spring-music' chart:"
echo "   helm create spring-music"
echo "   rm -rf spring-music/templates/*"
echo "   rm -rf spring-music/values.yaml"

echo ""
echo "Create the following files with specific project's content"
echo "   spring-music/values.yaml"
echo "   spring-music/templates/_helper.tpl"
echo "   spring-music/templates/deployment.yaml"
echo "   spring-music/templates/svc.yaml"

echo ""

echo "To install chart:"
echo "   helm install spring-music ./spring-music --set cluster=local"
echo "   kubectl port-forward service/spring-music 8080:80 &"

echo ""
echo "Browse http://127.0.0.1.nip.io:8080/"

echo ""
echo "Done"