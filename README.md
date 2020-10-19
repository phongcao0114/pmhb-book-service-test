# pmhb-book-service-test
Robot test examples for pmhb-book-service using RESTInstance library.

# Getting Started
- Installation & Usage: github.com/asyrjasalo/RESTinstance

- Get pmhb-book-service
    ```bash
    go get github.com/phongcao0114/pmhb-book-service
    ```

# Running
1. Run pmhb-book-service
2. Run robot test:
    ```bash
    python3 -m robot -v CONFIG_FILE:config.dev.txt 
                     -d results/ 
                     book-service-test.robot
    ```
3. Check test report in ./pmhb-book-service-test/results/report.html