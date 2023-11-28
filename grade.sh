CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission > grading-area/clone-message.txt 2>&1
echo 'Finished cloning'

if [[ -f "student-submission/ListExamples.java" ]]
then 
echo "file exists!"
else 
echo "file doesn't exists"
exit
fi 

cp -r student-submission/*   grading-area
cp ./*.java grading-area



javac -cp $CPATH *.java grading-area/*.java 2> grading-area/compile-error.txt



if [[ $? -ne 0 ]]; 
then 
    echo "compile error"
    exit
else
    echo "Compile successful" 
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore grading-area/TestListExamples > grading-area/output.txt 


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
