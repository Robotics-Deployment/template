from setuptools import setup

package_name = 'package'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml', 'entrypoint.sh']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='deniz',
    maintainer_email='deniz.hofmeister@gmail.com',
    description='TODO: Package description',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'node = package.node:main'
        ],
    },
)
