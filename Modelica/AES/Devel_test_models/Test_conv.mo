within AES.Devel_test_models;

model Test_conv
  extends Icons.TestModel;
  parameter Real[:] p1={1,2,3,1};
  parameter Real[:] p2={1,1};
  parameter Real[:] p3={1,2,3,4,1}; 
  final parameter Real[size(p1,1)+size(p2,1)-1] po1=Functions.conv(p1,p2);
  final parameter Real[size(p2,1)+size(p3,1)-1] po2=Functions.conv(p2,p3);
equation
end Test_conv;
