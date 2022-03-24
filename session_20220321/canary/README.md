kubectl apply -f 01-deployment-spring-music.yaml
kubectl apply -f 02-route-canary.yaml
kubectl apply -f 04-oauth.yaml
kubectl apply -f 05-ingress-oauth.yaml

kubectl port-forward service/oauth2-proxy 4180:4180 &
kubectl port-forward service/ingress-nginx-controller -n ingress-nginx 8443:443 &
kubectl port-forward service/ingress-nginx-controller -n ingress-nginx 8080:80 &

kubectl port-forward service/oauth2-proxy 4180:4180 &
kubectl port-forward service/ingress-nginx-controller -n ingress-nginx 443:443 &
kubectl port-forward service/ingress-nginx-controller -n ingress-nginx 80:80 &


# https://127.0.0.1.nip.io/oauth2/?error=redirect_uri_mismatch&error_description=The+redirect_uri+MUST+match+the+registered+callback+URL+for+this+application.&error_uri=https%3A%2F%2Fdocs.github.com%2Fapps%2Fmanaging-oauth-apps%2Ftroubleshooting-authorization-request-errors%2F%23redirect-uri-mismatch&state=Ie9iqSj6kC_Huv0Bc4INid3Y8g8aov75hus6DVZktDE%3A%2F
