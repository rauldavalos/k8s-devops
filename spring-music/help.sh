#!/usr/bin/env bash

echo "Spring Music Chart"
echo ""

echo "Create the 'spring-music' chart template:"
echo "   helm create spring-music"
echo "   rm -rf spring-music/templates/*"
echo "   rm -rf spring-music/values.yaml"

echo ""
echo "Create project's specific content"
echo "   spring-music/values.yaml"
echo "   spring-music/templates/_helper.tpl"
echo "   spring-music/templates/deployment.yaml"
echo "   spring-music/templates/svc.yaml"

echo ""
echo "Installing the project's chart:"
echo "   helm install spring-music ./spring-music --set cluster=local"
echo "   kubectl port-forward service/spring-music 8080:80 &"

echo ""
echo "Upgrading the project's chart:"
echo "   helm upgrade spring-music ./spring-music --set cluster=local"

echo ""
echo "Uninstalling the project's chart:"
echo "   helm uninstall spring-music"

echo ""
echo "Accessing the application:"
echo "   Browse http://127.0.0.1.nip.io:8080/"

echo ""
echo "Enjoy"
