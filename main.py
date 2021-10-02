from decouple import config


def main():

    env_var = config("DUMMY_VARIABLE", cast=str)

    print(f"Environment vars: {env_var}")

    while True:
        import time
        time.sleep(3)
        print("hello world")


if __name__ == "__main__":
    main()
