#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <dirent.h>
#include <openssl/evp.h>

// Function to get the name of the DLL file in the current directory
char* get_dll_file_name() {
    DIR *dir;
    struct dirent *ent;
    char* dllFileName = NULL;

    // Open the current directory
    if ((dir = opendir(".")) != NULL) {
        // Loop through the directory entries
        while ((ent = readdir(dir)) != NULL) {
            if (strstr(ent->d_name, ".dll")) {
                // Found a file with .dll extension
                dllFileName = strdup(ent->d_name);
                break;
            }
        }
        closedir(dir);
    }

    return dllFileName;
}

// Function to compute SHA256 hash of a string
void sha256_hash_string(const char* input, char* output) {
    EVP_MD_CTX *mdctx;
    const EVP_MD *md;
    unsigned char hash[EVP_MAX_MD_SIZE];
    unsigned int hash_len;

    md = EVP_sha256();
    mdctx = EVP_MD_CTX_new();
    EVP_DigestInit_ex(mdctx, md, NULL);
    EVP_DigestUpdate(mdctx, input, strlen(input));
    EVP_DigestFinal_ex(mdctx, hash, &hash_len);
    EVP_MD_CTX_free(mdctx);

    // Convert the hash to a human-readable string (hex format)
    for (unsigned int i = 0; i < hash_len; i++) {
        sprintf(&output[i * 2], "%02x", hash[i]);
    }
}

// Function to decode Base64 input
char* base64_decode(const char* input) {
    BIO *bio, *b64;
    int len = strlen(input);
    char* buffer = (char*)malloc(len); // Base64 decoded buffer

    bio = BIO_new_mem_buf(input, len);
    b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);

    // Set Base64 decoding options
    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL);

    // Decode Base64 data
    BIO_read(bio, buffer, len);

    BIO_free_all(bio);

    return buffer;
}

int main() {
    // Get the name of the DLL file in the current directory
    char* dllFileName = get_dll_file_name();
    
    if (!dllFileName) {
        printf("Warning: Unauthorized access detected. System integrity compromised.\n********************************\n");
	printf("Proceeding further will result in severe consequences. Cease all activities immediately!\n");
        printf("One with the new ISRO's latest autonomous landing capability dll have access to the flag.\n");
        return 1;
    }

    // Compute the SHA256 hash of the DLL file name
    char hashOutput[EVP_MAX_MD_SIZE * 2 + 1]; // +1 for the null terminator
    sha256_hash_string(dllFileName, hashOutput);


    // The provided SHA256 hash to compare with
    const char* providedSHA256 = "0d31b61a85fbb5191ba4bbb352a50b028c624b605116f09fe5fb4874c21d3828";
    // Compare the computed SHA256 hash with the provided value
    if (strcmp(hashOutput, providedSHA256) == 0) {
        // The Base64-encoded message to decode and display
        const char* base64EncodedMsg = "QkJCe1IzdjNyczNfVGgzX0MwZGV9";

        // Decode the Base64 message
        char* decodedMsg = base64_decode(base64EncodedMsg);
	printf("Congratulations! You have successfully navigated through the challenges.\n");
    	printf("Here is your flag: %s\n", decodedMsg);
    	printf("Well done on your persistence and skills.\n");
        // Free the allocated memory for the decoded message
        free(decodedMsg);
    } else {
	printf("Caution: You are approaching a restricted area.\n");
        printf("Your actions are being monitored. Proceeding further might lead to irreversible actions.\n");
        printf("However, You are close but your Launch Vehicle is not correct model or updated\n");
    }

    // Free the allocated memory for dllFileName
    free(dllFileName);

    return 0;
}
