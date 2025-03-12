#include <stdio.h>
#include <string.h>

#define MAX_LEN 15

void memDump(char *str) {
    while (*str) {
        printf("%p %d %c\n", str, *str, *str);
        str++;
    }
}

int getHash(char *str) {
    int sum = 0, count = 0;
    while (*str) {
        sum += *str;
        count++;
        str++;
    }
    return sum / count;
}

int isPalindrome(char *str) {
    char *end = str + strlen(str) - 1;
    while (str < end) {
        if (*str != *end) return 0;
        str++;
        end--;
    }
    return 1;
}

void printFromIndex(char *str, int index) {
    if (index >= 0 && index < strlen(str)) {
        printf("%s\n", str + index);
    } else {
        printf("Invalid index!\n");
    }
}

void reverseString(char *str) {
    int len = strlen(str);
    char *start = str;
    char *end = str + len - 1;
    char temp;

    while (start < end) {
        temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }

    printf("%s\n", str); 


int main() {
    char word[MAX_LEN + 1];
    int choice, index;

    printf("Enter a word: ");
    scanf("%15s", word);

    printf("1) Memory dump\n2) Hash value\n3) Palindrome check\n4) Print from index\n5) Reverse\nChoose: ");
    scanf("%d", &choice);

    if (choice == 1) memDump(word);
    else if (choice == 2) printf("Hash: %d\n", getHash(word));
    else if (choice == 3) printf(isPalindrome(word) ? "Palindrome!\n" : "Not a palindrome!\n");
    else if (choice == 4) {
        printf("Enter index: ");
        scanf("%d", &index);
        printFromIndex(word, index);
    }
    else if (choice == 5) reverseString(word);
    else printf("Invalid choice!\n");

    return 0;
}
